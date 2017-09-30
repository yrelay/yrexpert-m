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

;%DLLANCT^INT^1^59547,73868^0
%DLLANCT ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
STOCK(REPLA,LANC,COMPO,OP,DX) 
 N I,ATCHARG,ATMAC,DATJAL,NO,D,%I2,D1,CH,MAC,NOP,%II,TYPG,NIVE,MAP,NOMOP
 N PROF,COMP,ATDUJAL,PHR,DUJ,TEMP,TEMPDA,TEMPREC
 S MAP=MODEX=2
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 S TEMPDA=$$CONCAS^%QZCHAD(TEMP,"DAT")
 S TEMPREC=$$CONCAS^%QZCHAD(TEMP,"PREC")
 K @(TEMP)
 S %I2="",D1=""
 F %I=0:0 S %I2=$O(@OP@(%I2)) Q:%I2=""  S @TEMPDA@(@OP@(%I2,2),%I2)=""
 S DY=23,PHR=$$^%QZCHW("Jalon")_" : "
 S ATCHARG=$$CHARGAR^%DLCON2
 S ATMAC=$$MACHINE^%DLCON2
 S DATJAL=$$DATEJAL^%DLCON2,ATDUJAL=$$DUJAL^%DLCON2
 S D=""
 S I=$$PRVRIAO^%QSTRUC8(REPLA,LANC,DATJAL,"")
BSTOCK S D1=$O(@TEMPDA@(D1))
 G:D1="" PREC
 S D=D1_",0/"_(D1+1)_",0"
 S %I2=""
BSTO2 S %I2=$O(@TEMPDA@(D1,%I2))
 G:%I2="" BSTOCK
 S I=I+1
 I VISU X XY W I
 S @TEMPREC@(%I2)=I
 D:MAP STATT^%TLBAATT(REPLA,LANC,DATJAL,D,I,"AJOUT")
 D PA^%QSGESTI(REPLA,LANC,DATJAL,D,I)
 S DUJ=$S($O(@TEMPDA@(D1,%I2))'="":0,$O(@TEMPDA@(D1))="":"",1:$O(@TEMPDA@(D1))-D1)
 S CH=@OP@(%I2,1)
 G:'($D(@OP@(%I2,3))) BSTAR
 
 S MAC=@OP@(%I2,3)
 G:DUJ="" BSTO4
 G:DUJ=0 BSTO3
 S REG=$$REGIME^%DLREGIM(@OP@($O(@TEMPDA@($O(@TEMPDA@(D1)),"")),3))
 S:REG="" REG=$$REGSTAND^%QMDRUTI
 S DUJ=$$NBJ^%QMDRUTI(REG,D1,$O(@TEMPDA@(D1)))
BSTO3 D:MAP STATT^%TLBAATT(REPLA,LANC,ATDUJAL,DUJ,I,"AJOUT")
 D PA^%QSGESTI(REPLA,LANC,ATDUJAL,DUJ,I)
BSTO4 S COMP=$S($D(@OP@(%I2,7)):@OP@(%I2,7),1:COMPO)
 S NOP=@OP@(%I2,4),NOMOP=COMP_","_@OP@(%I2)
 S PROF=$S($D(@OP@(%I2,5)):@OP@(%I2,5),1:"")
BSTT0 G:MODEX=0 BSTT
 D STATT^%TLBAATT(REPLA,LANC,ATCHARG,CH,I,"AJOUT")
 D STATT^%TLBAATT(REPLA,LANC,ATMAC,MAC,I,"AJOUT")
 D STATT^%TLBAATT(REPLA,LANC,"NUMERO.OPERATION",NOP,I,"AJOUT")
 D STATT^%TLBAATT(REPLA,LANC,"OPERATION",NOMOP,I,"AJOUT")
 D:PROF'="" STATT^%TLBAATT(REPLA,LANC,"PROFONDEUR",PROF,I,"AJOUT")
 D:$D(@OP@(%I2,9)) STATT^%TLBAATT(REPLA,LANC,"NB.JOURS.DECALAGE",@OP@(%I2,9),I,"AJOUT")
BSTT D PA^%QSGESTI(REPLA,LANC,ATCHARG,CH,I)
 D PA^%QSGESTI(REPLA,LANC,ATMAC,MAC,I)
 D PA^%QSGESTI(REPLA,LANC,"NUMERO.OPERATION",NOP,I)
 D PA^%QSGESTI(REPLA,LANC,"OPERATION",NOMOP,I)
 D:PROF'="" PA^%QSGESTI(REPLA,LANC,"PROFONDEUR",PROF,I)
 D:$D(@OP@(%I2,9)) PA^%QSGESTI(REPLA,LANC,"NB.JOURS.DECALAGE",@OP@(%I2,9),I)
 S ^[QUI]MACOP(MAC,$$DATENO3^%QMDATE(D),LANC,I,NOMOP)=CH_"^"
 G BSTO2
 
BSTAR 
 G:'(MAP) BSTAR2
 D:DUJ'="" STATT^%TLBAATT(REPLA,LANC,ATDUJAL,DUJ,I,"AJOUT")
 D STATT^%TLBAATT(REPLA,LANC,"ARTICLE.JALONNE",@OP@(%I2),I,"AJOUT")
 D STATT^%TLBAATT(REPLA,LANC,"PROFONDEUR",CH,I,"AJOUT")
BSTAR2 D PA^%QSGESTI(REPLA,LANC,"ARTICLE.JALONNE",@OP@(%I2),I)
 D PA^%QSGESTI(REPLA,LANC,"PROFONDEUR",CH,I)
 D:DUJ'="" PA^%QSGESTI(REPLA,LANC,ATDUJAL,DUJ,I)
 G BSTO2
 
PREC S %I2=""
 B "L"
BPREC S %I2=$O(@OP@(%I2))
 G:%I2="" FIN
 G:'($D(@OP@(%I2,10))) BPREC
 D PA^%QSGESTI(REPLA,LANC,"PRECEDENT",@TEMPREC@(@OP@(%I2,10)),@TEMPREC@(%I2))
 D:MODEX=2 STATT^%TLBAATT(REPLA,LANC,"PRECEDENT",@TEMPREC@(@OP@(%I2,10)),@TEMPREC@(%I2),"AJOUT")
 G BPREC
 
FIN D:MODEX=2 STATT^%TLBAATT(REPLA,LANC,$$DELNEC^%DLCON2,D,1,"AJOUT")
 D PA^%QSGESTI(REPLA,LANC,$$DELNEC^%DLCON2,D,1)
 K @(TEMP)
 Q
 ;

