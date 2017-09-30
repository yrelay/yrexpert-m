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
;! HL002 ! HL     ! 27/06/12 ! S ^MEN($I,PG,"AFF")="19^5^77^-1"               !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%VMENUPG^INT^1^59547,74035^0
GEMENUPG(%T,AD,CONT) 
 ;;
 ;;      gestionnaires de menu (construction de la structure du menu si
 ;;      inexistante, affichage du menu et gestion de la selection, 
 ;;      renvoi de donnees correspondant a la selection)
 ;;      
 ;;      parametres:
 ;;         entree -> %T= nom d'une table de description du menu
 ;;         sortie -> . l'utilisateur a frappe un caractere de controle
 ;;                     Ctrl<car>  AD=""  
 ;;                                CONT=<car>^nom routine associee
 ;;                   . sinon      AD=nom routine associee a l'option 
 ;;                                   choisie
 ;;                                CONT=""  
 ;; |-----------------------------------------------------------------|
 ;; | %T table telle que :                                            |
 ;; |    @%T@("PG")=nom du menu (1)                                   |
 ;; |    @%T@("XG")=Valeur de X gauche            0 par defaut        |
 ;; |    @%T@("XD")=Valeur de X droit            79 par defaut        |
 ;; |    @%T@("YH")=Valeur de Y haut              0 par defaut        |
 ;; |    @%T@("YB")=Valeur de Y bas              23 par defaut        |
 ;; |    @%T@("DL")=Distance horiz. entre deux options  1 par defaut  |
 ;; |    @%T@("DC")=Distance vertic. entre deux options 1 par defaut  |
 ;; |    @%T@("CADRE")=1 si options encadrees                         |
 ;; |    @%T@("REVID")=1 si options en inverse video                  |
 ;; |    @%T@("REVID")=2 si options en bold + inverse video           |
 ;; |    @%T@("AFF")=0 si non reaffichage (1 par defaut)              |
 ;; |    @%T@("MES")=Nom du global contenant les options (1)          |
 ;; |    @%T@("NUM")=0/1 affichage des numeros (+selection) 1 par def |
 ;; |    @%T@("SEUL")=0/1 un seul libelle par ligne      0 par defaut |
 ;; |    @%T@("ALIGN")=0/1 alignement des colonnes       1 par defaut |
 ;; |-----------------------------------------------------------------|
 ;;       (1) obligatoire
 
 
 
 N %A1,%B,%EQI,%U,%Y,AD2,AD1,CC,DX,DY,GL,IPG,LC,LEQ,LIB,MSG,PAG,PAGP,T1,T2,T3,T4,T5,T6,T7,XD,XG,YB,YH,ALIGN,SEUL,MES,AFF,DL,DC,NUM,%L,OP,Y1,%A2
 
 D REINIT^%EDPRLG
 F AD="PG","MES" G FIN:'($D(@%T@(AD))) S @AD=@%T@(AD)
 K DEF S DEF("AFF")=1,DEF("REVID")=0,DEF("CADRE")=0,DEF("XG")=0,DEF("XD")=70,DEF("YH")=0,DEF("YB")=23,DEF("DL")=1,DEF("DC")=1,DEF("NUM")=1,DEF("SEUL")=0,DEF("ALIGN")=1
 F AD="XG","XD","YH","YB","DL","DC","AFF","REVID","CADRE","NUM","SEUL","ALIGN" S:'($D(@%T@(AD))) @%T@(AD)=DEF(AD) S @AD=@%T@(AD)
 S:(CADRE=1)!(REVID'=0) XG=XG+1,XD=XD-1,YB=YB-1,YH=YH+1
 
 
 ;HL002 D VIDEO^%VMENVID K DEF S AD="",CONT="",T1="^GM4($I,PG)",T2="^GM2($I,PG)",T3="^GM1($I,PG)",T4="^GM3($I,PG)",T5="^GM5($I,PG)",T6="^GM6($I,PG)",T7="^GM7($I,PG)" F %U=T1,T2,T3,T4,T5,T6,T7 I '($D(@%U)) D ^%VMENGEN Q
 D VIDEO^%VMENVID K DEF S AD="",CONT="",T1="^GM4($I,PG)",T2="^GM2($I,PG)",T3="^GM1($I,PG)",T4="^GM3($I,PG)",T5="^GM5($I,PG)",T6="^GM6($I,PG)",T7="^GM7($I,PG)" F %U=T1,T2,T3,T4,T5,T6,T7 S ^MEN($I,PG,"AFF")="19^5^77^-1" D ^%VMENGEN Q
 S (PAGP,PAG)=$S(($D(^GM1($I,PG))#10)=1:$P(^GM1($I,PG),"^",1),1:1)
 
 
 
AFM G:PAGP=PAG AFM1
AFM0 
 
 S IPG=PAGP,AD1="W $J("""",$L($TR(LIB,""#"","""")))",AD2="W $J("""",$L(OP))" D AFM2
AFM1 ;Affiche Page 1/x
 S IPG=PAG,AD1="D WRIT",AD2="W OP" D:REVID'=0 REV12^%VMENVID D:CADRE=1 CADR^%VMENVID D AFM2 S MSG=$ZP(@T1@(""))
 I MSG>1 S MSG=$$^%QZCHW("Page ")_PAG_"/"_MSG,DY=YH-1,DX=((XD+XG)\2)-6 X XY W $J("",12) S DX=((XD+XG)\2)-($L(MSG)\2) X XY W MSG
 G SUI
AFM2 ;Affiche le menu
 S PY=$O(@T2@(IPG,"")),PX=$O(@T2@(IPG,PY,""))
 S DY="" F %U=0:0 S DY=$O(@T2@(IPG,DY)) Q:DY=""  S DX="" F %U=0:0 S DX=$O(@T2@(IPG,DY,DX)) Q:DX=""  S LIB=@T2@(IPG,DY,DX) X XY,AD1
 
 
 
 ;Affiche le numéro
 S OP=$S(($D(@MES)#10)=1:$P(@MES,"^",4),1:0) Q:'(OP!NUM)  S GL=$S(OP:"^GM5($I,PG,IPG)",1:"^GM7($I,PG,IPG)")
 S LC=-1 F %U=0:0 S LC=$N(@GL@(LC)) Q:LC=-1  S CC=-1 F %U=0:0 S CC=$N(@GL@(LC,CC)) Q:CC=-1  S OP=@GL@(LC,CC),DY=LC,DX=(CC-$L(OP))-1 X XY,AD2
 K AD1,AD2,IPG Q
 
 
 
SUI D EFBM I ($D(^GM1($I,PG))#10)=1,$P(^GM1($I,PG),"^")=PAG S PX=$P(^GM1($I,PG),"^",2),PY=$P(^GM1($I,PG),"^",3)
 G ^%VMENLEC
 
 
 
 
WRIT S %A2=DX,%B=$L(LIB,"#") F %X=1:1:%B S %Y=$P(LIB,"#",%X) W %Y S %A1=$X D:(%X#2)=1 @VID(REVID,"BLD") D:(%X#2)=0 @VID(REVID,"NORM") S DX=%A1 X XY
 S DX=%A2
 K %B,%X,%A1,%Y D @VID(REVID,"NORM") Q
 
 
 
FIN 
 K %Z,%EQI,EQ,LI,LGI,LC,LMX,CC Q
 
 
 
EFBM S %EQI=^GM6($I,PG),LEQ=$P(%EQI,"^",4) S:LEQ=0 LEQ=(XD-XG)+1 D ^%VCRIFLD($J("",LEQ),$P(%EQI,"^",2)+1,$P(%EQI,"^",1),$P(%EQI,"^",2),$P(%EQI,"^",3)) Q
 
KILL(PG) 
 K ^GM4($I,PG),^GM2($I,PG),^GM1($I,PG),^GM3($I,PG),^GM5($I,PG),^GM6($I,PG),^GM7($I,PG)
 Q

