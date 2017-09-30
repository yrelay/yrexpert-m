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

;DTZECLA^INT^1^59547,74866^0
ECLATER ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N LIBGLO,INI,DX,DY,NBKEY,NIV,LIBG,LIBSAV,CLE,NBU,LIBNIV,%I
 D AFFI
 S INI=1
 G:'($D(^ECL)) ASK
 D ^%VZEAVT($$^%QZCHW("Attention: certains eclatements n'ont pas encore ete reconstitues..."))
 G:'($$CONFIRM^%VZEOUI($$^%QZCHW("Destruction du global intermediaire d'eclatement ?"))) ASK
 K ^ECL
 
ASK D:'(INI) AFFI
 S INI=0,LIBGLO=""
 S DX=10,DY=10 X XY S LIBGLO=$$^%VZAME1($$^%QZCHW("Nom du global (ex: ^[QUI]TOTO) ?"))
 I LIBGLO="" D:$D(^ECL) ^%VZEAVT($$^%QZCHW("N'oubliez pas la reconstitution (^RECONST)...")) Q
 I '($D(LIBGLO)) D ^%VZEAVT($$^%QZCHW("Le global ")_LIBGLO_$$^%QZCHW(" est inexistant...")) G ASK
 G:'($D(^ECL(LIBGLO))) ASKEY
 D ^%VZEAVT($$^%QZCHW("Le global ")_LIBGLO_$$^%QZCHW(" a deja ete eclate..."))
 G:'($$MES^%VZEOUI("Voulez-vous le sauvegarder de nouveau ?","N")) ASK
 K ^ECL(LIBGLO)
 
ASKEY G SAUV
 S DX=10,DY=11 X XY S NBKEY=$$^%VZAME1($$^%QZCHW("Nbre de cles du global (ex: 3) ?"))
 G:NBKEY="" ASK
 I ('($$NUM^%QZNBN(NBKEY)))!(NBKEY=0) D ^%VSQUEAK G ASKEY
SAUV 
 D POCLEPA^%VVIDEO
 G:'($$CONFIRM^%VZEOUI($$^%QZCHW("Ok pour l'eclatement ?"))) ASK
 D POCLEPA^%VVIDEO
 S NIV=1,LIBG=LIBGLO_"(",LIBSAV=LIBGLO,CLE(NIV)="""""",NBU=0,LIBNIV=""
 I ($D(@LIBGLO)#10)=1 S NBU=NBU+1,^ECL(LIBGLO,NBU,"!")=@LIBGLO W "."
BSAV S CLE(NIV)=$O(@LIBSAV@(CLE(NIV)))
 G:CLE(NIV)'="" B2SAV
 G:NIV=1 BFIN
 S NIV=NIV-1
 I NIV=1 S LIBSAV=LIBGLO,LIBNIV="" G BSAV
 S LIBNIV=$P(LIBNIV,LIBCLE(NIV),1,$L(LIBNIV,LIBCLE(NIV))-1)
 S LIBNIV=$E(LIBNIV,1,$L(LIBNIV)-1)
 S LIBSAV=LIBG_LIBNIV_")"
 G BSAV
B2SAV S LIBCLE(NIV)=""""_$$ZSUBST^%QZCHSUB(CLE(NIV),"""","""""")_""""
 D SAUVVAL
 G:$D(@LIBSAV@(CLE(NIV)))=1 BSAV
 S LIBNIV=$S(LIBNIV="":"",1:LIBNIV_",")_LIBCLE(NIV)
 S LIBSAV=LIBG_LIBNIV_")"
 S NIV=NIV+1
 S CLE(NIV)=""
 G BSAV
 
BFIN D POCLEPA^%VVIDEO
 D ^%VZEAVT($$^%QZCHW("Eclatement termine:")_" "_NBU_$$^%QZCHW(" nuplets eclates..."))
 G ASK
 
SAUVVAL Q:($D(@LIBSAV@(CLE(NIV)))#10)'=1
 S NBU=NBU+1
 F %I=1:1:NIV S ^ECL(LIBGLO,NBU,%I)=LIBCLE(%I)
 S ^ECL(LIBGLO,NBU,"!")=""""_$$ZSUBST^%QZCHSUB(@LIBSAV@(CLE(NIV)),"""","""""")_""""
 W "."
 D:(NBU#70)=0 POCLEPA^%VVIDEO
 Q
 
AFFI N BIG,DXG,DXD,DYH,DYB,GRAPH,MSG
 D CLEPAG^%VVIDEO
 S BIG=0,DXG=0,DXD=79,DYH=0,DYB=2,GRAPH=0,MSG="ECLATEMENT D'UN GLOBAL" D 4^%VZCD
 Q

