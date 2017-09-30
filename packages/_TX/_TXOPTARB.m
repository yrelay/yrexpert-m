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

;%TXOPTARB^INT^1^59547,74031^0
%TXOPTARB(ETU) 
DEBAT(ETUDE,ATELIER) 
 ;;entree pour un atelier (entree etude)
 S etu="^[QUI]etu(ETUDE)",ARB="^[QUI]arb(ETUDE)",tapb="^apb($j)",valpb="^valpb($j)",tmax="^tmax($j)"
 S APB=0,ARBRE=ARB,PB=0
 
 K @etu@("OPTIMUM"),@(tapb),@(valpb),@(ARB),@(tmax)
 S RACINE=$$GEN^%QCAPOP("NXP")
 S ORI=RACINE
 D PUSHVAL^%TXOPTPRIM(ARB,RACINE,"PERARB",1,PMAX)
 D PUSHVAL^%TXOPTPRIM(ARB,RACINE,"TYPE",1,0)
 D DEB(ETUDE,ATELIER)
 Q
DEB(ETUDE,ATELIER) 
 
 
 D ^%QARBCON("^[QUI]arb(ETUDE)","EVAL^%TXOPTARB","SEPAR^%TXOPTARB","SELEC^%TXOPTARB",RACINE)
 I $D(@etu@("OPTIMUM")) W !,!,*7,*7,"optimum",@etu@("OPTIMUM") R *x
 Q
 
EVAL(A,S,P,T) N V,SOMMET
 I $D(@etu@("OPTIMUM")) Q @etu@("OPTIMUM")
 S SOMMET=S
 
 
 
 I SOMMET=P S TYPE=0,ARTICLE="",NOVALIB=0,%VALATEL=0
 I SOMMET=P F z=0:0 S ARTICLE=$O(@etuatag@(ARTICLE)) G:ARTICLE="" FINATEL I $$ARTIMP D loadc1^%TXOPTETA(ETUDE,A,S,ATELIER) S DX=10,DY=10 X XY W ARTICLE D ARTICLE^%TXOPTARB(ETUDE,A,S,P,.PB,.APB,PMAX,PMAX,"",""),PUSHVAL^%TXOPTPRIM(A,S,"NOM.PB",ARTICLE,PB) S %VALATEL=%VALATEL+V,NOVALIB=NOVALIB+1
 
FINATEL 
 
 I SOMMET=P D PUSHVAL^%TXOPTPRIM(A,SOMMET,"VALEUR",1,%VALATEL) F t=1:1:PMAX D PUSHVAL^%TXOPTPRIM(A,SOMMET,"NOMBRE.DE.VARIABLES.LIBRES",t,NOVALIB)
 I SOMMET=P Q %VALATEL
 
 
 N T1 S T1=$$CONCAS^%QZCHAD(T,"STO") Q $$PULLVAL^%TXOPTPRIM(T1,S,"VALEUR",1)
FINVAL Q V
SEPAR(A,S,T) 
 I $D(@etu@("OPTIMUM")) Q @etu@("OPTIMUM")
 D SEPAR^%TXOPTSEP(A,S,T)
 Q 1
 
SELEC(A) N S,%i,VAL,VALMIN,NOEUD
 
 
 
 W !," selection "
 
 I $D(@etu@("OPTIMUM")) Q @etu@("OPTIMUM")
 
 S VALMIN=3000000000E-0,VAL="",NOEUD=""
 F %i=0:0 S VAL=$O(@A@("LIS",VAL)) Q:VAL=""  S S="" F %j=0:0 S S=$O(@A@("LIS",VAL,S)) Q:S=""  I $D(@A@("EXT",S)),VAL<VALMIN S VALMIN=VAL,NOEUD=S
 I NOEUD="" W !,">>>> echec : pas de solution <<<<" Q ""
 W !," **** selection ****",NOEUD,"***   valeur  *** ",VALMIN
 W !,"     valeur de la contrainte ",$$PULLVAL^%TXOPTPRIM(A,NOEUD,"VALEUR.DE.CONTRAINTE",1),!
 W !,"     type de noeud ",$$PULLVAL^%TXOPTPRIM(A,NOEUD,"TYPE",1),!
 W !,"     nombre de libres ",$$PULLVAL^%TXOPTPRIM(A,NOEUD,"NOMBRE.DE.VARIABLES.LIBRES",1),!
 Q NOEUD
printarb(A,RACINE) 
 N N,i,j,TYPE,VMIN
 W !,"*** sommet ***  ",RACINE,"   de pere ",@A@("INV",RACINE)
 W !,?10,"* valeur * ",@A@("VAL",RACINE),$S($D(@A@("EXT",RACINE)):" e ",1:"")
 S TYPE=$$PULLVAL^%TXOPTPRIM(A,RACINE,"TYPE",1)
 S VMIN=$$PULLVAL^%TXOPTPRIM(A,RACINE,"VALEUR.DE.CONTRAINTE",1)
 W !,?10,"* type * ",TYPE
 W !,?10,"* valeur de contrainte* ",VMIN
 
 I $O(@A@("ARB",RACINE,""))="" G FPRINT
 W !,?10,"* ici les fils de * ",RACINE,!
 S N="",j=10 F i=1:1 S N=$O(@A@("ARB",RACINE,N)) Q:N=""  W:j>75 ! S:j>75 j=10 W ?j,"* ",N," *"
 S N="" F i=1:1 S N=$O(@A@("ARB",RACINE,N)) Q:N=""  D printarb(A,N)
 
FPRINT 
 
 W !
 Q
 
 
ARTICLE(ETUDE,ARB,SOMMET,PERE,PB,APB,PMAX,TMAX,NEWQMIN,NEWQMAX) 
 D DEB^VTIME
 S NBC=17 D INIV^%TXOPTSW5(NBC,etuata)
 K @etuata@("Valeur") D STOCK,PROD,DMD
 S V=$$^%TXOPTETA(ETUDE,ARB,SOMMET,PERE,.PB,.APB,PMAX,TMAX,NEWQMIN,NEWQMAX)
 Q
ARTISEUL(ETUDE) 
 D DEB^VTIME
 S NBC=17 D INIV^%TXOPTSW5(NBC,etuata)
 K @etuata@("Valeur") D STOCK,PROD,DMD
 S ARTIMP=ARTICLE
 D DEBAT(ETUDE,ATELIER)
 S ARTIMP=""
 Q
ARTIMP() 
 I '($D(ARTIMP)) Q 1
 Q ARTIMP=ARTICLE
STOCK 
 S e="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""st"")",em="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""stm"")"
 S eM="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""stM"")"
 S vsm=$S($D(@etuata@("Valeur Std de Stock Mini")):@etuata@("Valeur Std de Stock Mini"),1:0),vsM=$S($D(@etuata@("Valeur Std de Stock Maxi")):@etuata@("Valeur Std de Stock Maxi"),1:0)
 S PMAX=@etu@("Nombre de Periodes")
 D ^%TXOPTSIN(e,em,eM,vsm,vsM)
 Q
DMD 
 S e="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""DMD"",""DEMANDE"")"
 S vst=0
 D INIV^%TXOPTSW6(e)
 Q
PROD 
 S e="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""q"")",em="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""qm"")"
 S eM="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""qM"")"
 S vsm=0,vsM=10000
 S PMAX=@etu@("Nombre de Periodes")
 D ^%TXOPTSIN(e,em,eM,vsm,vsM)
 Q
 
ATELIER(ETUDE) 
 S NBC=9 D INIV^%TXOPTSW2(NBC,etuat)
 D DEBAT(ETUDE,ATELIER)
 
CONTRAINTE 
 Q
 S e="^[QUI]etu(ETUDE,""AT"",ATELIER,""c"")",em="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""qm"")"
 S eM="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""qM"")"
 S vsm=0,vsM=10000
 D ^%TXOPTSIN(e,em,eM,vsm,vsM)
 Q

