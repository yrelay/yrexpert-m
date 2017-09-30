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

;%QSMODAT^INT^1^59547,73882^0
QSMODAT(MODEL,REP) 
 
 
 
 
 
 
 
 
 
 
 
 N ADRES,C,CONCUR,CONTR,DX,DY,LIGNE,M1,NOM,OK,PCH,PCHCOMP
 S LIGNE=1,NOM=""""_MODEL_""","""_REP_"""" D AFF
 S M1(1)=$$^%QZCHW("Liste des attributs")_"^LISTE"
 S M1(2)=$$^%QZCHW("Fin")_"^FIN"
 
 
SEL D POCLEPA^%VVIDEO
 D ^%VQUIKMN(0,80,23,"M1",.ADRES,.CONTR)
 I ADRES'="" G @ADRES
 I CONTR="R" D AFF G SEL
 I CONTR="J" D IMPR G SEL
 I "AF"[CONTR Q
 D ^%VSQUEAK G SEL
 
 
LISTE D ^%QULYSTE(0,5,80,18,"^RQSMOD4("_NOM_")",.LIGNE,"A^%QSMODAT","S^%QSMODAT")
 G SEL
 
FIN D CLEPAG^%VVIDEO Q
 
A S OK=1 Q
QDMM N LI D ^%LXIQ("AFF^%QSMODAT") S OK=0 Q
S S OK=1 Q
 
AFF D CLEPAG^%VVIDEO
 D ^%VZCD0("ATTRIBUTS PREDEFINIS")
 D CARSP^%VVIDEO(0,5,18,80,1)
 S DX=5,DY=5 X XY W $$^%QZCHW(" Liste des attributs ")
 D REAFF^%QULYSTE(LIGNE,"^RQSMOD4("_NOM_")",0,5,80,18)
 Q
 
M(M) D ^%VSQUEAK,POCLEPA^%VVIDEO W M," ... [RETURN]" R *C:^TOZE($I,"ATTENTE")
 D POCLEPA^%VVIDEO Q
IMPR N A,%A,C,LIGN,NLMAX,PAGE,PORT
IMP D ^%VSQUEAK,POCLEPA^%VVIDEO I $$MES^%VZEOUI($$^%QZCHW("Impression papier ? : "),"O")'=1 Q
79 D POCLEPA^%VVIDEO W $$^%QZCHW("Impression en cours ... un instant")
 S PORT=^TABIDENT(WHOIS,"PRINTER")
 S NLMAX=^TABIDENT(WHOIS,"IMPRCOUR")
 S PAGE=0,LIGN=0
 C PORT O PORT U PORT
 D TETE
 F A=1:1 Q:'($D(^RQSMOD4(MODEL,REP,A)))  D TA
 C PORT U 0
 D ^%VZEAVT($$^%QZCHW("Impression terminee "))
 Q
TETE S PAGE=PAGE+1
 W #
 W !,$$^%QZCHW("Le "),$$DATE^%QMDATE,$$^%QZCHW(" a "),$$HEURE^%QMDATE,?40,$$^%QZCHW("Liste des attributs predefinis")
 W !,$$^%QZCHW("Page : "),PAGE
 W !,!
 S LIGN=4
 Q
TA W !,A,$J("",10-$L(A)),^RQSMOD4(MODEL,REP,A) S LIGN=LIGN+1
 I LIGN>(NLMAX-5) D TETE
 Q
 
 
MOD D QSMODAT(RESUL(1),RESUL(2)),CLEPAG^%VVIDEO Q

