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

;%AN7^INT^1^59547,73866^0
AN7 ;
 
 
 
 
 
 
 
 
LONG(CH,POS) Q:($L(CH)+1)=POS 1
 N C D ^%VZEAVT($$^%QZCHW("Trop de caracteres a la fin de la chaine ")) Q 0
 
 
 
INIT(X,Y) S PRGRREAF="",ERRMES=1,SYNTX=X,SYNTY=Y Q
INIT2(X,Y) S PRGRREAF="",ERRMES=0,SYNTX=X,SYNTY=Y Q
REAF(R) S PRGRREAF=R Q
AFF1(C) Q:'($D(SYNTX))  Q:'(ERRMES)
 N LI
 S LI=SYNTX\80,DX=SYNTX-(LI*80),DY=SYNTY+LI X XY D:SUB'="C-IBM PC" BLD^%VVIDEO D:SUB="C-IBM PC" UDL^%VVIDEO X XY W C D NORM^%VVIDEO Q
REAFF1 S DY=SY,DX=SX X XY W CH X XY D:SUB'="C-IBM PC" BLD^%VVIDEO D:SUB="C-IBM PC" UDL^%VVIDEO X XY W $E(CH,1,P) D NORM^%VVIDEO Q
 
AFF(C) N PR
 S PR=$$^%QCAZG("%PROVEN")
 I (((((((PR'="TRT")&(PR'="RQS"))&(PR'="ED"))&(PR'="EDMOD"))&(PR'="EDSY"))&(PR'="EDFORMAT"))&(PR'="SD"))&(PR'="HEV") D AFF1(C) Q
 Q:'($D(SYNTX))  Q:'(ERRMES)
 N LI
 S:'($D(VVDX)) VVDX=SX
 S:'($D(VVDY)) VVDY=SY
 S:'($D(VVYB)) VVYB=SY+1
 S:'($D(VVYH)) VVYH=SY-1
 S:'($D(VVPA)) VVPA=1
 S:'($D(VVTX)) VVTX=SYNTX-1
 Q:VVTX=SYNTX  S VVTX=SYNTX
 D ^%VREADA(UCONT,CH,SYNTX-1,.VVDX,.VVDY,SX-1,(SX+DH)-3,.VVYB,.VVYH,.VVPA)
 S PAGE=VVPA
 Q
REAFF N PR
 S PR=$$^%QCAZG("%PROVEN")
 I (((((PR="TRT")!(PR="RQS"))!(PR="ED"))!(PR="EDMOD"))!(PR="EDSY"))!(PR="SD") D REAFF^%VREADA(CH,SYNTX-1,SX+1,SY,SX-1,(SX+DH)-3,VVYB,VVYH,VVPA) Q
 S DY=SY,DX=SX X XY W CH X XY D:SUB'="C-IBM PC" BLD^%VVIDEO D:SUB="C-IBM PC" UDL^%VVIDEO X XY W $E(CH,1,P) D NORM^%VVIDEO Q
LEC Q:'($D(SYNTX))  S SYNTX=SYNTX+1 Q
END K PRGRREAF,ERRMES,SYNTX,SYNTY,VVDX,VVDY,VVYB,VVYH,VVPA,VVTX Q
LEX K SYNLEX Q
ADD(MOT) S SYNLEX(MOT)="" Q
MOT(MOT) Q $D(SYNLEX(MOT))'=0

