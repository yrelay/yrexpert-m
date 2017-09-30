;!----------------------------------------------------------------------------!
;!                                                                            !
;! Licence et conditions d'utilisation                                        !
;! Yexpert : (your) Systeme Expert sous Mumps GT.M et GNU/Linux               !
;! Copyright (C) 2001-2015 by Hamid LOUAKED (HL).                             !
;!                                                                            !
;! Hamid LOUAKED                                                              !
;! 10, impasse Faraday                                                        !
;! 78520 LIMAY                                                                !
;! France                                                                     !
;!                                                                            !
;! yexpert@yrelay.fr                                                          !
;! http://www.yrelay.fr/                                                      !
;!                                                                            !
;! Ce programme est un logiciel libre ; vous pouvez le redistribuer           !
;! et/ou le modifier conformement aux dispositions de la Licence Publique     !
;! Generale GNU, telle que publiee par la Free Software Foundation ;          !
;! version 3 de la licence, ou encore (a votre choix) toute version ulterieure.
;!                                                                            !
;! Ce programme est distribue dans l'espoir qu'il sera utile,                 !
;! mais SANS AUCUNE GARANTIE ; sans meme la garantie implicite de             !
;! COMMERCIALISATION ou D'ADAPTATION A UN OBJET PARTICULIER.                  !
;! Pour plus de details, voir la Licence Publique Generale GNU.               !
;!                                                                            !
;! Un exemplaire de la Licence Publique Generale GNU doit etre fourni avec    !
;! ce programme ; si ce n'est pas le cas,                                     !
;! ecrivez a la Free Software Foundation Inc.,                                !
;! 675 Mass Ave, Cambridge, MA 02139, Etats-Unis.                             !
;!                                                                            !
;! Ce logiciel est telechargeable a l'adresse http://www.yrelay.fr/ ;         !
;! vous trouverez egalement, sur ce site, un mode d'emploi complet            !
;! et des informations supplementaires.                                       !
;!                                                                            !
;!----------------------------------------------------------------------------!
;!                                                                            !
;! GNU General Public License : http://www.gnu.org/copyleft/gpl.html          !
;!                                                                            !
;! Traduction francaise : http://dachary.org/loic/gpl-french.pdf              !
;!                                                                            !
;!----------------------------------------------------------------------------!

;!============================================================================!
;! Nomprog     :                                                              !
;! Module      :                                                              !
;! But         :                                                              !
;!                                                                            !
;! Description :                                                              !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%TXPARB^INT^1^59547,74032^0
%TXPARB(ETU) ;;08:18 PM  19 Mar 1993; ; 29 Apr 93  7:26 PM
 
DEBAT(ETUDE,ATELIER) 
 
 K @(tapb),@(valpb),@(tmax)
 S APB=0,ARBRE=ARB,PB=0
 
 K @etuat@("OPTIMUM"),@(ARB)
 S RACINE=$$GEN^%QCAPOP("NXP")
 S ORI=RACINE
 S PMAX=$$^%TXPMAX(ATELIER)
 D PUSHVAL^%TXPPRIM(ARB,RACINE,"PERARB",1,PMAX)
 D PUSHVAL^%TXPPRIM(ARB,RACINE,"TYPE",1,0)
 
 D DEB(ETUDE,ATELIER)
 
 Q
 
DEB(ETUDE,ATELIER) 
 N VISU
 S VISU=$S('($D(^TXPMODE($J,"VISU"))):0,1:^TXPMODE($J,"VISU"))
 D ^%QARBCON("^[QUI]arb(ETUDE,ATELIER)","EVAL^%TXPARB","SEPAR^%TXPARB","SELEC^%TXPARB",RACINE)
 I $D(@etuat@("OPTIMUM")) W !,!,"optimum",@etuat@("OPTIMUM")
 Q
 
EVAL(A,S,P,T) N V,SOMMET
 I $D(@etuat@("OPTIMUM")) Q @etuat@("OPTIMUM")
 S SOMMET=S
 
 I VISU>1 W !," evaluation de ",S," de pere ",P H 1
 
 
 G:SOMMET'=P FINATEL
 S TYPE=0,ARTICLE="",NOVALIB=0,%VALATEL=0
EV2 S ARTICLE=$O(@etuatag@(ARTICLE)) G:ARTICLE="" FINATEL
 G:'($$ARTIMP) EV2
 D loadc1^%TXPETA(ETUDE,A,S,ATELIER) S DX=10,DY=10 X XY W ARTICLE
 S CTRT=VLIMI
 D ARTICLE^%TXPARB(ETUDE,A,S,P,.PB,.APB,PMAX,PMAX,"","",CTRT)
 D PUSHVAL^%TXPPRIM(A,S,"NOM.PB",ARTICLE,PB)
 S %VALATEL=%VALATEL+V,NOVALIB=NOVALIB+1,VALEUR=V\1
 
 D LINEUP^%TXPSUTI
 G EV2
 
FINATEL 
 
 I SOMMET=P D PUSHVAL^%TXPPRIM(A,SOMMET,"VALEUR",1,%VALATEL) F t=1:1:PMAX D PUSHVAL^%TXPPRIM(A,SOMMET,"NOMBRE.DE.VARIABLES.LIBRES",t,NOVALIB)
 I SOMMET=P Q %VALATEL
 
 
 N T1 S T1=$$CONCAS^%QZCHAD(T,"STO"),V=$$PULLVAL^%TXPPRIM(T1,S,"VALEUR",1)
FINVAL 
 Q V\1
 
SEPAR(A,S,T) 
 I $D(@etuat@("OPTIMUM")) Q @etuat@("OPTIMUM")
 
 
 D SEPAR^%TXPSEP(A,S,T) I VISU>1,printer=0 U 0 R %xxx
 Q 1
 
SELEC(A) N S,%i,VAL,VALMIN,NOEUD
 
 
 S printer=32
 
 I VISU#2 U printer W !," selection "
 I VISU D printarb(A,RACINE),^%TXP212R
 I $D(@etuat@("OPTIMUM")) S NOEUD=@etuat@("OPTIMUM") D ^%TXP112R(ETUDE,A,NOEUD,pb,apb,ATELIER,ARTICLE,PMAX,demd,printer,VISU)
 
 S VALMIN=VLIMI,VAL="",NOEUD=""
 F %i=0:0 S VAL=$O(@A@("LIS",VAL)) Q:VAL=""  S S="" F %j=0:0 S S=$O(@A@("LIS",VAL,S)) Q:S=""  I $D(@A@("EXT",S)),VAL<VALMIN S VALMIN=VAL,NOEUD=S
 I NOEUD="",VISU#2 U printer W !,">>>> echec : pas de solution <<<<"
 I NOEUD="" Q ""
 
 I $D(^TXPMODE($J,"arbo")),^TXPMODE($J,"arbo")=1 D ELEM^%QULELV(STRAFFI,NOEUD,$$PERE^%QARBCON(A,NOEUD))
 I VISU#2 U printer W !," **** selection ****",NOEUD,"***   valeur  *** ",VALMIN
 I VISU#2 U printer W !," (prv)    valeur de la contrainte ",$$PULLVAL^%TXPPRIM(A,NOEUD,"VALEUR.DE.CONTRAINTE",1),!
 I VISU#2 U printer W !,"     type de noeud ",$$PULLVAL^%TXPPRIM(A,NOEUD,"TYPE",1),!
 S TYPE=$$PULLVAL^%TXPPRIM(A,NOEUD,"TYPE",1)
 S ARTICLE=$$PULLVAL^%TXPPRIM(A,NOEUD,"ARTICLE.A.ARBITRER",1)
 S PERIODE=$$PULLVAL^%TXPPRIM(A,NOEUD,"PERIODE.A.ARBITRER",1)
 I (TYPE=2)!(TYPE=1),VISU#2 W " quantite ctg ",$$PULLMAT^%TXPPRIM(A,NOEUD,"QMINP",PERIODE,ARTICLE)
 I (TYPE=3)!(TYPE=1),VISU#2 W " quantite ctg ",$$PULLMAT^%TXPPRIM(A,NOEUD,"QMAXP",PERIODE,ARTICLE)
 I VISU#2 U printer W !,"     article a arbitrer ",ARTICLE
 I VISU#2 U printer W !,"     periode a arbitrer ",PERIODE
 I VISU#2 U printer W !,"     quantite a arbitrer ",$$PULLVAL^%TXPPRIM(A,NOEUD,"QUANTITE.A.ARBITRER",1),!
 I VISU#2 U printer W !,"     nombre de libres ",$$PULLVAL^%TXPPRIM(A,NOEUD,"NOMBRE.DE.VARIABLES.LIBRES",PERIODE),!
 I VISU#2,printer=0,VISU>1 R *%x
 Q NOEUD
printarb(A,RACINE) 
 N N,i,j,TYPE,VMIN
 S printer=32 ;;;;;;o printer
 
 U printer W !,"*** sommet ***  ",RACINE,"   de pere ",@A@("INV",RACINE)
 U printer W !,?10,"* valeur * ",@A@("VAL",RACINE),$S($D(@A@("EXT",RACINE)):" e ",1:"")
 S TYPE=$$PULLVAL^%TXPPRIM(A,RACINE,"TYPE",1)
 S VMIN=$$PULLVAL^%TXPPRIM(A,RACINE,"VALEUR.DE.CONTRAINTE",1)
 S %capa=$O(@etuatcg@(""))
 S PERIODE=$$PULLVAL^%TXPPRIM(A,RACINE,"PERIODE.A.ARBITRER",1),VCTR="*"
 I PERIODE>0 S VCTR=$$PULLMAT^%TXPPRIM(A,RACINE,"VALEUR.MAXI.DE.CONTRAINTE",PERIODE,%capa)
 S REALISA=$$PULLVAL^%TXPPRIM(A,RACINE,"IRREALISABLE",1)
 U printer W !,?10,"* type * ",TYPE," realisable : ",$S(REALISA="NON":"OUI",1:"NON")
 U printer W !,?10,"* valeur de contrainte * ",VMIN
 U printer W !,?10,"* valeur MAXI de contrainte * ",VCTR," en ",PERIODE
 U printer W !,?10,"* valeur de jauge* ",@A@("VAL",RACINE)
 I $O(@A@("ARB",RACINE,""))="" G FPRINT
 U printer W !,?10,"* ici les fils de * ",RACINE,! U 0 I printer=0,VISU>1 R *u
 U printer S N="",j=10 F i=1:1 S N=$O(@A@("ARB",RACINE,N)) Q:N=""  W:j>75 ! S:j>75 j=10 W ?j,"* ",N," *"
 S N="" F i=1:1 S N=$O(@A@("ARB",RACINE,N)) Q:N=""  D printarb(A,N)
 
FPRINT 
 I printer=0 U 0 R *xxx
 U printer W !
 Q
 
 
ARTICLE(ETUDE,ARB,SOMMET,PERE,PB,APB,PMAX,TMAX,NEWQMIN,NEWQMAX,CTRT) 
 N OLDVAL
 S:'($D(VALEUR)) VALEUR=VLIMI
 S OLDVAL=VALEUR
 D DEB^%VTIME
 S NBC=17 D INIART^%TXPSW2(etuata)
 K @(SOL)
 K @etuata@("Valeur Jauge") D STOCK,PROD,DMD
 S V=$$^%TXPETA(ETUDE,ARB,SOMMET,PERE,.PB,.APB,PMAX,TMAX,NEWQMIN,NEWQMAX,CTRT)
 S VALEUR=V,@etuata@("Valeur Jauge")=V D LINEUP^%TXPSUTI S VALEUR=OLDVAL
 Q
ARTISEUL(ETUDE) 
 D DEB^%VTIME
 S NBC=17 D INIART^%TXPSW2(etuata)
 K @(SOL)
 K @etuata@("Valeur Jauge") D STOCK,PROD,DMD
 S ARTIMP=ARTICLE
 D DEBAT(ETUDE,ATELIER)
 S ARTIMP=""
 Q
ARTIMP() 
 
 I ARTIMP=" pas d'article impose" Q 1
 ;;;w !," artimp ",ARTIMP," ",ARTICLE
 Q ARTIMP=ARTICLE
STOCK 
 S e="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""st"")",em="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""stm"")"
 S eM="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""stM"")"
 S vsm=$S($D(@etuata@("Valeur Std de Stock Mini")):@etuata@("Valeur Std de Stock Mini"),1:0),vsM=$S($D(@etuata@("Valeur Std de Stock Maxi")):@etuata@("Valeur Std de Stock Maxi"),1:0)
 S PMAX=$$^%TXPMAX(ATELIER)
 D ^%TXPSINS(e,em,eM,vsm,vsM,0)
 Q
DMD 
 S e="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""DMD"",""DEMANDE"")"
 S vst=0
 D INIDEM^%TXPSW3(e)
 Q
PROD 
 S e="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""q"")",em="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""qm"")"
 S eM="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""qM"")"
 S vsm=0,vsM=1000000
 S PMAX=$$^%TXPMAX(ATELIER)
 D ^%TXPSINS(e,em,eM,vsm,vsM,0)
 Q
 
ATELIER(ETUDE) 
 N %A,V,VA
 S NBC=9 D INIATT^%TXPSW2(etuat)
 
 
 
SUI S ARTIMP=" pas d'article impose" D DEBAT(ETUDE,ATELIER)
 D VALATE^%TXPSUTI(ETUDE,ATELIER)
 
CONTRAINTE 
 Q
 S e="^[QUI]etu(ETUDE,""AT"",ATELIER,""c"")",em="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""qm"")"
 S eM="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""qM"")"
 S vsm=0,vsM=100000
 D ^%TXPSINS(e,em,eM,vsm,vsM,0)
 Q

