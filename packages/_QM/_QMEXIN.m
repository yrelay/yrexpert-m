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

;%QMEXIN^INT^1^59547,73878^0
%QMEXIN ;;08:50 AM  7 Jul 1993; 22 Dec 92 10:40 AM ; 09 Sep 93  9:08 AM
 
 
 
 N MODECR,REPATN,MOD,FILE1,FILE2,FILE3,CML,L,%IL,I,%I,LISTE
 D CLEPAG^%VVIDEO
 S FILE1="",FILE2="",FILE3=""
 S R=$$SAISIE^%QMEXAR2(.FILE1,.FILE2,.FILE3,0)
 Q:R=0
 D IN(FILE1,FILE2,FILE3)
 
 S LISTE=$$TEMP^%SGUTIL
 S I="" F %I=0:0 S I=$$NXTRI^%QSTRUC8("RESEAU",I) Q:I=""  I $$^%QSCALIN("RESEAU",I,"TYPE.ATN",1)="RESEAU HEVEA" S @LISTE@(I)=""
 D COMPIL^%QMEXATN(LISTE)
 K @(LISTE)
 Q
 
 
 
IN(FILE1,FILE2,FILE3) 
 N LISTE,LISTATT,BASE,GLILA,LPF,LINVO,REPLIEN
 N ENSTRT,ENSPRD,LSAISIE
 
 S OPF=$$OKFILE(FILE1)
 D RESTDON^%SGPDIN2(FILE1,0,2)
 
 S OPF=$$OKFILE(FILE2)
 D RESTK
 
 Q:FILE3=""
 S OPF=$$OKFILE(FILE3)
 D:FILE3'="" RESTDON^%SGPDIN2(FILE3,0,2)
 
 Q
OKFILE(NFIC) 
 N IOFI,OKRET
 D OPENFILE^%SYSUTI1(NFIC,"R",.IOFI,.OKRET)
 Q:'(OKRET) 0
 D CLOSE^%SYSUTI1(IOFI,"R")
 Q 1
 
 
RESTK 
 N NFIC
 N ENSOBJ,Y1,I,RES,MENU1,MENU2,EXAM,NOTALL,OKRET,IOFI,OKLEC
 N ETTL,EREQ,EFOR,EMOD,EREQ,EPSV,EMSQ,LCHX,ENSLOAD,EPRD
 N X,Y,Z,T,COM,TYPE,ECRAS,WRITE,OBJ,RET,%II,ICOUR,LCH,NFIC
 N CODE,OKCODE,GCODE
 S NFIC=FILE2
 S ENSOBJ=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"OBJ") K @(ENSOBJ)
 S LCHX=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"CHX") K @(LCHX)
 S ETTL=$$CONCAS^%QZCHAD(LCHX,"TRT"),EMOD=$$CONCAS^%QZCHAD(LCHX,"MOD")
 S EFOR=$$CONCAS^%QZCHAD(LCHX,"FOR"),EREQ=$$CONCAS^%QZCHAD(LCHX,"REQ")
 S EPSV=$$CONCAS^%QZCHAD(LCHX,"PSV"),EMSQ=$$CONCAS^%QZCHAD(LCHX,"MSQ")
 S EPRD=$$CONCAS^%QZCHAD(LCHX,"PRD")
 S ENSLOAD=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"LD") K @(ENSLOAD)
 D OPENFILE^%SYSUTI1(NFIC,"R",.IOFI,.OKRET)
 
 I '(OKRET) D RESTPBF^%SGPDKSF(NFIC) Q
 S COM(1)=$$READ^%SYSUTI1(IOFI,.OKLEC)
 
 I $P(COM(1)," ",1)="archivage" D CLOSE^%SYSUTI1(IOFI,"R"),RESTD^%SGPDKSF(NFIC) Q
 
 I $P(COM(1)," ",1)'="sauvegarde" D CLOSE^%SYSUTI1(IOFI,"R"),RESTSF^%SGPDKSF(NFIC) Q
 S COM(2)=$$READ^%SYSUTI1(IOFI,.OKLEC)
 S CODE=$P(COM(2),$C(0),2),COM(2)=$P(COM(2),$C(0))
 S GCODE=$$TEMP^%SGUTIL
 
 S OKCODE=1
 D:OKCODE PROLREST^%INCOIN2(GCODE)
 S NOTALL=0
 S ECRAS=1
 D TRAIT^%SGPKIN
 Q

