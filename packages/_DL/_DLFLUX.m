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

;%DLFLUX^INT^1^59547,73868^0
DLFLUX ;
 
 
 
 
 
 N M,MC,DD,DD1,DD2,L,I,OC,OC1,NOC,D,DJC
 N SCR,RESUL,V,U,CMS,NOMTAB,PATOUCH,DEJALU,X,Y,MAC,ST
 N %FLU,REPL,DJAL,MACHI,GLO,DAT1,DAT2,ATTR
DEB K LISMAC,^LISFLUX($J),^OPEFLUX($J)
 
 D CLEPAG^%VVIDEO,^%VZCD0("REPRESENTATION DES FLUX JALONNES")
 S SCR="DLFJFLU" F U=1:1:^%SCRE(SCR) S RESUL(U)="",PATOUCH(U)="",DEJALU(U)=""
GET S CMS=0,NOMTAB=" " D BEG^%VAFIGRI,^%VAFISCR,^%VMODISC
 I ABENDSCR Q
 I RESUL(1)="" D ^%VZEAVT($$^%QZCHW("Veuillez donner un schema de flux")) G GET
 S V=1
 F U="%FLU","DAT1","DAT2","ATTR" S @U=RESUL(V),V=V+1
 S DX=0,DY=5 D CLEBAS^%VVIDEO,POCLEPA^%VVIDEO X XY W $$^%QZCHW("Taper CTRLA pour abandonner...")
 
 S REPL=$$LAN^%DLCON2
 
 S LIEN=$$LIEN1^%QSGEL2(REPL,$$ART^%DLCON2,3)
 
 S MACHI=$$MACHINE^%DLCON2
 
 S DJAL=$$DATEJAL^%DLCON2
 
 S DD1=$$10^%QMDATE1(DAT1)
 S DD2=DAT2,ST=$$FINT^%QMDAUC(REPL,DJAL,.DD2)
 S DD=DD1-1,DD=$$01^%QMDATE1(DD),ST=$$FINT^%QMDAUC(REPL,DJAL,.DD)
 
 S GLO=$$LAV^%QSGEST6(REPL,DJAL)
 
LISMAC 
 S X=""
 F U=0:0 S X=$O(^[QUI]DLFLUX(%FLU,"POINTS",X)) Q:X=""  S Y="" F UU=0:0 S Y=$O(^[QUI]DLFLUX(%FLU,"POINTS",X,Y)) Q:Y=""  S MAC="" F UUU=0:0 S MAC=$O(^[QUI]DLFLUX(%FLU,"POINTS",X,Y,MAC)) Q:MAC=""  S LISMAC(MAC)=""
 D CUROF^%VVIDEO
L1 
 R *ST:0 G ABORT:ST=1
 S DD=$O(@GLO@(DD)) G FIN:DD="",FIN:DD>DD2
 S I=""
L2 R *ST:0 G ABORT:ST=1
 S I=$O(@GLO@(DD,I)) G L1:I=""
 
 S L=""
L3 R *ST:0 G ABORT:ST=1
 S L=$O(@GLO@(DD,I,L)) G L2:L=""
 
 W "."
 S M=$$^%QSCALIN(REPL,L,MACHI,I) G L3:M="",L3:'($D(LISMAC(M)))
 
 S OC1=$$^%QSCALIN(REPL,L,"NUMERO.OPERATION",I)
 
 S C=$$^%QSCALVA(REPL,L,LIEN)_","_$$^%QSCALVA(REPL,L,"GAMME")
 
 S OC=C_","_$$^%QSCALIN($$GAMME^%DLCON2,C,$$GO^%DLCON2,OC1)
LD R *ST:0 G ABORT:ST=1
 S NOC=$$^%QSCALIN(REPL,L,"NUMERO.OPERATION",I+1) G L3:NOC=""
 
 S OC1=$$^%QSCALIN($$GAMME^%DLCON2,C,$$GO^%DLCON2,NOC) G L3:OC1=""
 
 S DJC=$$^%QSCALIN(REPL,L,DJAL,I+1) G L3:DJC>DD2
 
 S MC=$$^%QSCALIN(REPL,L,MACHI,I+1)
 
 G L3:MC="",L3:'($D(LISMAC(MC)))
 S ^LISFLUX($J,M,MC)=$$^%QCAZG("^LISFLUX($J,M,MC)")+$$CALVA^%DLFGVAL(C_","_OC1,MC,ATTR)
 S ^OPEFLUX($J,M,OC)=""
 S ^OPEFLUX($J,MC,C_","_OC1)=""
 W "*"
 G L3
 
FIN D CURON^%VVIDEO
 D ^%DLFLDES("^LISFLUX($J)","^OPEFLUX($J)",%FLU,DAT1,DAT2,"FLUX JALONNE, exprime en "_ATTR,0)
 D ^%DLFNOFL
 
 K LISMAC,^LISFLUX($J),^OPEFLUX($J)
 G DEB
 
ABORT D ^%VZEAVT("Abandon par decision de l'utilisateur.") G DEB
 
 
 
UCONT 
UCSCH S REFUSE=1,CTRLF=0 Q:RESUL(IC)=""
 Q:'($D(^[QUI]DLFLUX(RESUL(IC))))
 S REFUSE=0 Q
 
UCATT 
 S REFUSE=0,CTRLF=0 Q:RESUL(IC)="UNITE.DE.COMPTE"
 I RESUL(IC)="" S REFUSE=1 Q
 
 S REFUSE=0 Q
 
DAT 
 N DAT,DD
 I RESUL(ICC)="" S DAT=$$01^%QMDATE1($H) G FDATL
 S DAT=$$CORRECT^%VYDAT(RESUL(ICC)) Q:DAT=""
FDATL S TAB(ICC)=DAT
 D ^%VAFFICH
 Q

