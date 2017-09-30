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

;%QSVAREL^INT^1^59547,73883^0
QSVAREL(T,VA) 
 
 
 
 
 
 
 N %S,%TM,BA,QU,S,TM,REP,GLO
 D ^%VZEATT
 S REP=$$NOMINT^%QSF(BASE),QU=$S(T="AVANT":"VARACTP",1:"VARACTE")
 G:'($D(^[QUI]QSVARACT(T,VA,"BASE"))) SAUV
 S BA=$$NOMINT^%QSF(^[QUI]QSVARACT(T,VA,"BASE"))
 
 S TM="" F %TM=0:0 S TM=$O(^[QUI]QSVARAT1(T,VA,TM)) Q:TM=""  S S="" F %S=0:0 S S=$O(^[QUI]QSVARAT1(T,VA,TM,BA,S)) Q:S=""  K ^[QUI]QSVARAT(T,TM,BA,S,VA)
 K ^[QUI]QSVARAT1(T,VA)
SAUV 
 S ^[QUI]QSVARACT(T,VA,"BASE")=BASE,^[QUI]QSVARACT(T,VA,"COMM")=COMM
 S ^[QUI]QSVARACT(T,VA,"ATTRIBUT")=ATT
 S ^[QUI]QSVARACT(T,VA,"TYPMAJ")=TYPMAJ
 S ^[QUI]QSVARACT(T,VA,"ETAT")=ETAT
 
 I ETAT="NON ACTIVE" G FIN
 I ATT'="" D INS(ATT) G FIN
 
 S GLO=$$LISTATT2^%QSGEST6(REP),S=""
 F %S=0:0 S S=$O(@GLO@(S)) Q:S=""  D INS(S)
FIN 
 D PA^%QSGESTI(QU,VA,"NOM",VA,1)
 D PA^%QSGESTI(QU,VA,"COMMENTAIRE",COMM,1)
 D PA^%QSGESTI(QU,VA,"REPERTOIRE",BASE,1)
 D PA^%QSGESTI(QU,VA,"AUTEUR",WHOIS,1)
 D PA^%QSGESTI(QU,VA,"SITE",$I,1)
 D PA^%QSGESTI(QU,VA,"DATE.CREATION",$$DATE^%QMDATE,1)
 D PA^%QSGESTI(QU,VA,"HEURE.CREATION",$$HEURE^%QMDATE,1)
 D PA^%QSGESTI(QU,VA,"ETAT",ETAT,1)
 Q
 
INS(A) 
 I TYPMAJ'="" S ^[QUI]QSVARAT(T,TYPMAJ,REP,A,VA)="",^[QUI]QSVARAT1(T,VA,TYPMAJ,REP,A)="" Q
 
 
 
 F TM="AJOUT","MODIFICATION","SUPPRESSION" S ^[QUI]QSVARAT(T,TM,REP,A,VA)="",^[QUI]QSVARAT1(T,VA,TM,REP,A)=""
 Q
 
 
LECT(T,VA,NV) 
 
 S BASE=^[QUI]QSVARACT(T,VA,"BASE")
 S COMM=^[QUI]QSVARACT(T,VA,"COMM")
 S ATT=^[QUI]QSVARACT(T,VA,"ATTRIBUT")
 S TYPMAJ=^[QUI]QSVARACT(T,VA,"TYPMAJ")
 S ETAT=^[QUI]QSVARACT(T,VA,"ETAT")
 
 S SITL="^[QUI]QSVARACT("""_T_""","""_VA_""",""SITUATIONS"",""LIGNE"")"
 S SITC="^[QUI]QSVARACT("""_T_""","""_VA_""",""SITUATIONS"",""COMP"")"
 S ACT="^[QUI]QSVARACT("""_T_""","""_VA_""",""ACTIONS"")"
 I NV="" Q
 N NSITL,NSITC,NACT,I
 S NSITL="^[QUI]QSVARACT("""_T_""","""_NV_""",""SITUATIONS"",""LIGNE"")"
 S NSITC="^[QUI]QSVARACT("""_T_""","""_NV_""",""SITUATIONS"",""COMP"")"
 S NACT="^[QUI]QSVARACT("""_T_""","""_NV_""",""ACTIONS"")"
 S I=""
BNSIT S I=$O(@SITL@(I)) I I="" G FNSIT
 S @NSITL@(I)=@SITL@(I),@NSITC@(I)=@SITC@(I)
 G BNSIT
FNSIT 
BNACT S I=$O(@ACT@(I)) I I="" G FNACT
 S @NACT@(I)=@ACT@(I),@NACT@(I,"TETE")=$$RECOP^%ANA(@ACT@(I,"TETE"))
 G BNACT
FNACT 
 S SITL=NSITL,SITC=NSITC,ACT=NACT
 Q
INIT(T,VA) 
 
 K ^[QUI]QSVARACT(T,VA)
 S BASE=""
 S COMM=""
 S ATT=""
 S TYPMAJ=""
 S ETAT="NON ACTIVE"
 
 S SITL="^[QUI]QSVARACT("""_T_""","""_VA_""",""SITUATIONS"",""LIGNE"")"
 S SITC="^[QUI]QSVARACT("""_T_""","""_VA_""",""SITUATIONS"",""COMP"")"
 S SITCC="^[QUI]QSVARACT("""_T_""","""_VA_""",""SITUATIONS"")"
 S ACT="^[QUI]QSVARACT("""_T_""","""_VA_""",""ACTIONS"")"
 Q
 
EXIST(T,VA) 
 Q $D(^[QUI]QSVARACT(T,VA))
 
SUPPR(T,VA) 
 Q:'($D(^[QUI]QSVARACT(T,VA)))
 S QU=$S(T="AVANT":"VARACTP",1:"VARACTE")
 S BASE=$$NOMINT^%QSF(^[QUI]QSVARACT(T,VA,"BASE"))
 S DX=$X,DY=$Y X XY W "."
 D SX^%QSGESTK(QU,VA) K ^[QUI]QSVARACT(T,VA)
 S TM="" F %TM=0:0 S TM=$O(^[QUI]QSVARAT1(T,VA,TM)) Q:TM=""  S S="" F %S=0:0 S S=$O(^[QUI]QSVARAT1(T,VA,TM,BASE,S)) Q:S=""  K ^[QUI]QSVARAT(T,TM,BASE,S,VA)
 K ^[QUI]QSVARAT1(T,VA)
 Q

