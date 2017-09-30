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

;%DLCONOM^INT^1^59547,73867^0
DLCONOM ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
CONSNOM(REPAR,ARTIC,QU,DUFAB,ATQUAN,REPLIEN,LIEN,INVLIEN,PART,GLPART,LRES,TEMPRES) 
 N O,NIV,DEL,IN,NOMLIEN,LLIST,TTYP,RENOM,RESOB,NIV,NOVO,NIVF,NIVOF
 N QUF,QI,ERR,REG,ATREG,LPREC,VU,MES,DELFAB,FT,ATFAM
 S ERR=0
 S MES=$$^%QZCHW("Representation de la nomenclature de")_" "_ARTIC
 I VISU D MSG^%VZEATT(MES) S DX=$L(MES)+2
 S ATREG=$$REGIME^%DLCON2,DELFAB=$$DELFAB^%DLCON2
 S ATFAM=$$FAMILLE^%DLCON2
 S LLIST=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"CONSNOM")
 S LPREC=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"PRECEDE")
 K @(LLIST),@(TEMPRES)
 S RESOB=$$CONCAS^%QZCHAD(TEMPRES,"OBJ")
 S RENOM=$$CONCAS^%QZCHAD(TEMPRES,"NOM")
 S FAMTEC=$$CONCAS^%QZCHAD(TEMPRES,"FAM.TEC")
 S ARNONVU=$$CONCAS^%QZCHAD(TEMPRES,"ARTICLE.VU")
 S @RENOM@(1)=1,@RENOM@(1,1)=ARTIC
 S @RENOM@(1,1,"QU")=QU
 S NIV=""
BNIV S NIV=$O(@RENOM@(NIV))
 G:NIV="" FINNOM
 S NIVO=""
BNIVO S NIVO=$O(@RENOM@(NIV,NIVO))
 G:NIVO="" BNIV
 I PART G:'(@GLPART@(NIV,NIVO)) BNIVO
 S @ARNONVU@(NIV,NIVO)=""
 I VISU X XY W NIV," ",NIVO
 S O=@RENOM@(NIV,NIVO)
 S DELSUP=0
 I $D(@RESOB@(O)) S DEL=@RESOB@(O,"DEL"),FT=@FAMTEC@(1,O) G BOB2
 K @(LLIST)
 D MVG^%QSCALVA(REPAR,O,"DELAI.SUPPLEMENTAIRE",LLIST,.TTYP)
 S IN="" F %I=0:0 S IN=$O(@LLIST@(IN)) Q:IN=""  S DELSUP=DELSUP+@LLIST@(IN)
 S @RESOB@(O,"DEL.SUP")=DELSUP
 S DEL=$$^%QSCALVA(REPAR,O,DELFAB)
 S @RESOB@(O,"DEL")=DEL
 S REG=$$^%QSCALVA(REPAR,O,ATREG)
 I REG="" D:(DEL'="")!(DELSUP'=0) INSERR2^%DLUTIL(" "_$$NOMLOG^%QSF(REPAR)_" "_O,6,LRES) S REG="STANDARD"
 S @RESOB@(O,"REGIME")=REG
 S FT=$$^%QSCALVA(REPAR,O,ATFAM)
 S:FT="" FT="*"
 S @FAMTEC@(1,O)=FT
BOB2 I '($D(@FAMTEC@(2,FT))) S @FAMTEC@(2,FT)=O,@FAMTEC@(2,FT,NIV)="" G BOB3
 S NIVF=$O(@FAMTEC@(2,FT,""))
 I NIVF>NIV S @FAMTEC@(2,FT)=O,@FAMTEC@(2,FT,NIV)=""
BOB3 K @(LLIST)
 D MVG^%QSCALVA(REPAR,O,LIEN,LLIST,.TTYP)
 G:@LLIST=0 BNIVO
 S QI=@RENOM@(NIV,NIVO,"QU")
 S NIVF=NIV+1
 S NIVOF=$S($D(@RENOM@(NIVF)):@RENOM@(NIVF),1:0)
BFIL0 S IN="" K VU
BFILSS S IN=$O(@LLIST@(IN))
 G:IN="" PREC
 S NIVOF=NIVOF+1
 S IND=@LLIST@(IN)
 S NOMLIEN=$$NOML1^%QSGES20(O,IND,LIEN,IND)
 I NOMLIEN="" S ERR=21 G ERRNOM
 S QUF=$$^%QSCALVA(REPLIEN,NOMLIEN,ATQUAN)
 S:QUF="" QUF=1
 S VU(IN)=NIVOF
 S @RENOM@(NIV,NIVO,"F",NIVOF)=""
 S @RENOM@(NIVF,NIVOF)=IND
 S @RENOM@(NIVF,NIVOF,"P")=O
 S @RENOM@(NIVF,NIVOF,"QU")=QUF*QI
 S NOMLIEN=$$NOML1^%QSGES20(IND,O,INVLIEN,O)
 I NOMLIEN="" S ERR=22 G ERRNOM
 S DEL=$$^%QSCALVA(REPLIEN,NOMLIEN,"DUREE.INTEGRATION")+0
 S @RENOM@(NIVF,NIVOF,"DEL.TRANS")=DEL
 D COPORD("SUIV"),COPORD("PREC")
 G:DEL=0 BFILSS
 S REG=$$^%QSCALVA(REPLIEN,NOMLIEN,ATREG)
 S:REG="" REG="STANDARD"
 S @RENOM@(NIVF,NIVOF,"REGIME")=REG
 G BFILSS
 
 
PREC S @RENOM@(NIVF)=NIVOF
 K @(LPREC)
 D MVG^%QSCALVA(REPAR,O,"PRECEDENCE.COMPOSANT",LPREC,.TTYP)
 G:@LPREC=0 BNIVO
 S IN=""
BPREC S IN=$O(@LPREC@(IN))
 G:IN="" BNIVO
 S IND=@LPREC@(IN)
 S PREC=$P(IND,","),PREC1=$P(IND,",",2)
 G:(PREC="")!(PREC1="") BPREC
 G:'($D(VU(PREC))) BPREC
 G:'($D(VU(PREC1))) BPREC
 S PREC=VU(PREC),PREC1=VU(PREC1)
 S @RENOM@(NIVF,PREC,"SUIV",NIVF,PREC1)=""
 S @RENOM@(NIVF,PREC1,"PREC",NIVF,PREC)=""
 G BPREC
 
FINNOM K @(LLIST)
 Q ERR
 
 
 
APRECED(DELO) 
 S PREC=""
BAPREC1 S PREC=$O(@RENOM@(NIV,NIVO,"PREC",PREC))
 Q:PREC=""
 S PREC1=""
BAPREC2 S PREC1=$O(@RENOM@(NIV,NIVO,"PREC",PREC,PREC1))
 G:PREC1="" BAPREC1
 I '($D(@RENOM@(PREC,PREC1,"DAT"))) S @RENOM@(PREC,PREC1,"DAT")=DELO G BAPREC2
 G:@RENOM@(PREC,PREC1,"DAT")'>DELO BAPREC2
 S @RENOM@(PREC,PREC1,"DAT")=DELO
 G BAPREC2
 
 
 
APRECE2(DELO) 
 S PREC=""
BAPRC2 S PREC=$O(@RENOM@(NIV,NIVO,"PREC",PREC))
 Q:PREC=""
 S PREC1=""
BAPRC22 S PREC1=$O(@RENOM@(NIV,NIVO,"PREC",PREC,PREC1))
 G:PREC1="" BAPRC2
 I '($D(@GREJAL2@(PREC,PREC1))) S @GREJAL2@(PREC,PREC1)=DELO G BAPREC2
 G:@GREJAL2@(PREC,PREC1)'>DELO BAPRC22
 S @GREJAL2@(PREC,PREC1)=DELO
 G BAPRC22
 
 
 
ORDRE(PRESUIV) 
 S PREC=""
SUIV1 S PREC=$O(@RENOM@(NIV,NIVO,PRESUIV,PREC))
 Q:PREC="" 1
 S PREC1=""
SUIV2 S PREC1=$O(@RENOM@(NIV,NIVO,PRESUIV,PREC,PREC1))
 G:PREC1="" SUIV1
 Q:$D(@ARNONVU@(PREC,PREC1)) 0
 G SUIV2
 
 
 
MAXPREC(DATINI) 
 N DAT
 S DAT=DATINI,PREC=""
BMAX S PREC=$O(@RENOM@(NIV,NIVO,"PREC",PREC))
 Q:PREC="" DAT
 S PREC1=""
BMAX1 S PREC1=$O(@RENOM@(NIV,NIVO,"PREC",PREC,PREC1))
 G:PREC1="" BMAX
 G:@RENOM@(PREC,PREC1,"DAT")'>DAT BMAX1
 S DAT=@RENOM@(PREC,PREC1,"DAT")
 G BMAX1
 
 
 
MAXPRE2(DATINI) 
 N DAT
 S DAT=DATINI,PREC=""
BMAX2 S PREC=$O(@RENOM@(NIV,NIVO,"PREC",PREC))
 Q:PREC="" DAT
 S PREC1=""
BMAX21 S PREC1=$O(@RENOM@(NIV,NIVO,"PREC",PREC,PREC1))
 G:PREC1="" BMAX2
 G:@GREJAL2@(PREC,PREC1)'>DAT BMAX21
 S DAT=@GREJAL2@(PREC,PREC1)
 G BMAX21
 
 
COPORD(PRESUIV) 
 S PREC=""
BCOP S PREC=$O(@RENOM@(NIV,NIVO,PRESUIV,PREC))
 Q:PREC=""
 S PREC1=""
BCOP1 S PREC1=$O(@RENOM@(NIV,NIVO,PRESUIV,PREC,PREC1))
 G:PREC1="" BCOP
 S @RENOM@(NIVF,NIVOF,PRESUIV,PREC,PREC1)=""
 G BCOP1

